(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_5 ?v2)
		(pred_4 ?v5)
		(pred_6 ?v5)
		(pred_3 ?v2 ?v5)
		(pred_2)
		(pred_1 ?v2))

   (:action op_2
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_4 ?v1) (pred_4 ?v6) (pred_6 ?v1))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v1))))


   (:action op_1
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_5 ?v7) (pred_4 ?v8)
			    (pred_3 ?v7 ?v8) (pred_6 ?v8) (pred_2))
       :effect (and (pred_1 ?v7)
		    (not (pred_3 ?v7 ?v8)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_5 ?v7) (pred_4 ?v8)
			    (pred_1 ?v7) (pred_6 ?v8))
       :effect (and (pred_3 ?v7 ?v8)
		    (pred_2)
		    (not (pred_1 ?v7)))))
