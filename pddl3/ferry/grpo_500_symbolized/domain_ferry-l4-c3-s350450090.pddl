(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v6)
		(pred_2 ?v8)
		(pred_3 ?v7)
		(pred_6 ?v7)
		(pred_4 ?v8 ?v7)
		(pred_5)
		(pred_1 ?v8))

   (:action op_3
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_3 ?v3) (pred_3 ?v5) (pred_6 ?v3))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v3))))


   (:action op_2
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_3 ?v2)
			    (pred_4 ?v4 ?v2) (pred_6 ?v2) (pred_5))
       :effect (and (pred_1 ?v4)
		    (not (pred_4 ?v4 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_2 ?v4) (pred_3 ?v2)
			    (pred_1 ?v4) (pred_6 ?v2))
       :effect (and (pred_4 ?v4 ?v2)
		    (pred_5)
		    (not (pred_1 ?v4)))))
