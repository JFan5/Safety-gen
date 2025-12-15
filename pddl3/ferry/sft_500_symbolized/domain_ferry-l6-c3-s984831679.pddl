(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_3 ?v1)
		(pred_2 ?v2)
		(pred_4 ?v2)
		(pred_5 ?v1 ?v2)
		(pred_1)
		(pred_6 ?v1))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_2 ?v4) (pred_2 ?v7) (pred_4 ?v4))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_5 ?v3 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_6 ?v3)
		    (not (pred_5 ?v3 ?v8)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_6 ?v3) (pred_4 ?v8))
       :effect (and (pred_5 ?v3 ?v8)
		    (pred_1)
		    (not (pred_6 ?v3)))))
