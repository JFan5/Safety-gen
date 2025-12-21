(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_5 ?v3)
		(pred_4 ?v5)
		(pred_3 ?v5)
		(pred_6 ?v3 ?v5)
		(pred_2)
		(pred_1 ?v3))

   (:action op_1
       :parameters  (?v1 ?v7)
       :precondition (and (not-eq ?v1 ?v7) 
                          (pred_4 ?v1) (pred_4 ?v7) (pred_3 ?v1))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v1))))


   (:action op_3
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v8)
			    (pred_6 ?v4 ?v8) (pred_3 ?v8) (pred_2))
       :effect (and (pred_1 ?v4)
		    (not (pred_6 ?v4 ?v8)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v8)
			    (pred_1 ?v4) (pred_3 ?v8))
       :effect (and (pred_6 ?v4 ?v8)
		    (pred_2)
		    (not (pred_1 ?v4)))))
