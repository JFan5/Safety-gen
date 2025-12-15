(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_2 ?v1)
		(pred_3 ?v6)
		(pred_1 ?v6)
		(pred_4 ?v1 ?v6)
		(pred_5)
		(pred_6 ?v1))

   (:action op_3
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_3 ?v4) (pred_3 ?v2) (pred_1 ?v4))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v8)
			    (pred_4 ?v3 ?v8) (pred_1 ?v8) (pred_5))
       :effect (and (pred_6 ?v3)
		    (not (pred_4 ?v3 ?v8)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_2 ?v3) (pred_3 ?v8)
			    (pred_6 ?v3) (pred_1 ?v8))
       :effect (and (pred_4 ?v3 ?v8)
		    (pred_5)
		    (not (pred_6 ?v3)))))
