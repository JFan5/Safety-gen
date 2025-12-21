(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_1 ?v5)
		(pred_3 ?v1)
		(pred_6 ?v1)
		(pred_2 ?v5 ?v1)
		(pred_4)
		(pred_5 ?v5))

   (:action op_2
       :parameters  (?v8 ?v7)
       :precondition (and (not-eq ?v8 ?v7) 
                          (pred_3 ?v8) (pred_3 ?v7) (pred_6 ?v8))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_1 ?v3) (pred_3 ?v4)
			    (pred_2 ?v3 ?v4) (pred_6 ?v4) (pred_4))
       :effect (and (pred_5 ?v3)
		    (not (pred_2 ?v3 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_1 ?v3) (pred_3 ?v4)
			    (pred_5 ?v3) (pred_6 ?v4))
       :effect (and (pred_2 ?v3 ?v4)
		    (pred_4)
		    (not (pred_5 ?v3)))))
