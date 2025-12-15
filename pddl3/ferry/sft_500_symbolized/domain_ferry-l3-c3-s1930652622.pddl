(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_6 ?v5)
		(pred_2 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v5 ?v3)
		(pred_5)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_2 ?v8) (pred_2 ?v4) (pred_1 ?v8))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_2 ?v2)
			    (pred_3 ?v1 ?v2) (pred_1 ?v2) (pred_5))
       :effect (and (pred_4 ?v1)
		    (not (pred_3 ?v1 ?v2)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_2 ?v2)
			    (pred_4 ?v1) (pred_1 ?v2))
       :effect (and (pred_3 ?v1 ?v2)
		    (pred_5)
		    (not (pred_4 ?v1)))))
