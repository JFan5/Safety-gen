(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_6 ?v5)
		(pred_1 ?v7)
		(pred_5 ?v7)
		(pred_2 ?v5 ?v7)
		(pred_3)
		(pred_4 ?v5))

   (:action op_3
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_1 ?v8) (pred_1 ?v3) (pred_5 ?v8))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v8))))


   (:action op_1
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_1 ?v2)
			    (pred_2 ?v1 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_4 ?v1)
		    (not (pred_2 ?v1 ?v2)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_1 ?v2)
			    (pred_4 ?v1) (pred_5 ?v2))
       :effect (and (pred_2 ?v1 ?v2)
		    (pred_3)
		    (not (pred_4 ?v1)))))
