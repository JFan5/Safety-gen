(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_3 ?v6)
		(pred_4 ?v4)
		(pred_6 ?v4)
		(pred_5 ?v6 ?v4)
		(pred_1)
		(pred_2 ?v6))

   (:action op_1
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_4 ?v1) (pred_4 ?v8) (pred_6 ?v1))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v1))))


   (:action op_2
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v5)
			    (pred_5 ?v3 ?v5) (pred_6 ?v5) (pred_1))
       :effect (and (pred_2 ?v3)
		    (not (pred_5 ?v3 ?v5)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v5)
			    (pred_2 ?v3) (pred_6 ?v5))
       :effect (and (pred_5 ?v3 ?v5)
		    (pred_1)
		    (not (pred_2 ?v3)))))
