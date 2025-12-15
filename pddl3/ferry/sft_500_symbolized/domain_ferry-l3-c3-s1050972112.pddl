(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_6 ?v5)
		(pred_4 ?v7)
		(pred_2 ?v7)
		(pred_5 ?v5 ?v7)
		(pred_3)
		(pred_1 ?v5))

   (:action op_1
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_4 ?v8) (pred_4 ?v4) (pred_2 ?v8))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v8))))


   (:action op_3
       :parameters (?v1 ?v3)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v3)
			    (pred_5 ?v1 ?v3) (pred_2 ?v3) (pred_3))
       :effect (and (pred_1 ?v1)
		    (not (pred_5 ?v1 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v1  ?v3)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v3)
			    (pred_1 ?v1) (pred_2 ?v3))
       :effect (and (pred_5 ?v1 ?v3)
		    (pred_3)
		    (not (pred_1 ?v1)))))
