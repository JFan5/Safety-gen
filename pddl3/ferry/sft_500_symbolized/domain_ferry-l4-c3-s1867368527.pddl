(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_1 ?v8)
		(pred_3 ?v4)
		(pred_6 ?v4)
		(pred_5 ?v8 ?v4)
		(pred_2)
		(pred_4 ?v8))

   (:action op_1
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_3 ?v6) (pred_3 ?v7) (pred_6 ?v6))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v1)
			    (pred_5 ?v5 ?v1) (pred_6 ?v1) (pred_2))
       :effect (and (pred_4 ?v5)
		    (not (pred_5 ?v5 ?v1)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v1)
			    (pred_4 ?v5) (pred_6 ?v1))
       :effect (and (pred_5 ?v5 ?v1)
		    (pred_2)
		    (not (pred_4 ?v5)))))
