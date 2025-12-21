(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_6 ?v1)
		(pred_3 ?v6)
		(pred_1 ?v6)
		(pred_2 ?v1 ?v6)
		(pred_5)
		(pred_4 ?v1))

   (:action op_3
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_3 ?v8) (pred_3 ?v5) (pred_1 ?v8))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v8))))


   (:action op_2
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v3)
			    (pred_2 ?v2 ?v3) (pred_1 ?v3) (pred_5))
       :effect (and (pred_4 ?v2)
		    (not (pred_2 ?v2 ?v3)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v3)
			    (pred_4 ?v2) (pred_1 ?v3))
       :effect (and (pred_2 ?v2 ?v3)
		    (pred_5)
		    (not (pred_4 ?v2)))))
