(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_1 ?v5)
		(pred_5 ?v3)
		(pred_2 ?v3)
		(pred_3 ?v5 ?v3)
		(pred_4)
		(pred_6 ?v5))

   (:action op_3
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_5 ?v6) (pred_5 ?v2) (pred_2 ?v6))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v1)
			    (pred_3 ?v7 ?v1) (pred_2 ?v1) (pred_4))
       :effect (and (pred_6 ?v7)
		    (not (pred_3 ?v7 ?v1)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v1)
			    (pred_6 ?v7) (pred_2 ?v1))
       :effect (and (pred_3 ?v7 ?v1)
		    (pred_4)
		    (not (pred_6 ?v7)))))
