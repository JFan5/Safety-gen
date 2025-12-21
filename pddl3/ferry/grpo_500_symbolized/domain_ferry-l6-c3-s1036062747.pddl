(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v8)
		(pred_3 ?v4)
		(pred_1 ?v6)
		(pred_6 ?v6)
		(pred_5 ?v4 ?v6)
		(pred_2)
		(pred_4 ?v4))

   (:action op_3
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_1 ?v5) (pred_1 ?v7) (pred_6 ?v5))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v1)
			    (pred_5 ?v3 ?v1) (pred_6 ?v1) (pred_2))
       :effect (and (pred_4 ?v3)
		    (not (pred_5 ?v3 ?v1)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v1)
			    (pred_4 ?v3) (pred_6 ?v1))
       :effect (and (pred_5 ?v3 ?v1)
		    (pred_2)
		    (not (pred_4 ?v3)))))
