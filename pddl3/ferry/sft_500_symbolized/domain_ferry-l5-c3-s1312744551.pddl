(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_1 ?v2)
		(pred_5 ?v3)
		(pred_6 ?v3)
		(pred_2 ?v2 ?v3)
		(pred_3)
		(pred_4 ?v2))

   (:action op_1
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_5 ?v6) (pred_5 ?v5) (pred_6 ?v6))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v1)
			    (pred_2 ?v7 ?v1) (pred_6 ?v1) (pred_3))
       :effect (and (pred_4 ?v7)
		    (not (pred_2 ?v7 ?v1)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v1)
			    (pred_4 ?v7) (pred_6 ?v1))
       :effect (and (pred_2 ?v7 ?v1)
		    (pred_3)
		    (not (pred_4 ?v7)))))
