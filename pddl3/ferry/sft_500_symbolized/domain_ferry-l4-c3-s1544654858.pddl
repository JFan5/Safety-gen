(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_4 ?v5)
		(pred_3 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v5 ?v4)
		(pred_5)
		(pred_1 ?v5))

   (:action op_2
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_3 ?v3) (pred_3 ?v1) (pred_6 ?v3))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v3))))


   (:action op_1
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_4 ?v7) (pred_3 ?v8)
			    (pred_2 ?v7 ?v8) (pred_6 ?v8) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_2 ?v7 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_4 ?v7) (pred_3 ?v8)
			    (pred_1 ?v7) (pred_6 ?v8))
       :effect (and (pred_2 ?v7 ?v8)
		    (pred_5)
		    (not (pred_1 ?v7)))))
