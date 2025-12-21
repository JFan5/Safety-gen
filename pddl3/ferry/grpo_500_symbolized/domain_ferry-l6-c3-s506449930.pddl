(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_3 ?v4)
		(pred_1 ?v7)
		(pred_5 ?v7)
		(pred_4 ?v4 ?v7)
		(pred_6)
		(pred_2 ?v4))

   (:action op_3
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_1 ?v3) (pred_1 ?v6) (pred_5 ?v3))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v3))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v1)
			    (pred_4 ?v5 ?v1) (pred_5 ?v1) (pred_6))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v1)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v1)
			    (pred_2 ?v5) (pred_5 ?v1))
       :effect (and (pred_4 ?v5 ?v1)
		    (pred_6)
		    (not (pred_2 ?v5)))))
