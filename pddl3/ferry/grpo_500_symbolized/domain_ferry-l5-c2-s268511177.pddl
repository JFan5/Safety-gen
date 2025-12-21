(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_1 ?v4)
		(pred_5 ?v7)
		(pred_6 ?v7)
		(pred_4 ?v4 ?v7)
		(pred_2)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_5 ?v8) (pred_5 ?v1) (pred_6 ?v8))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v2)
			    (pred_4 ?v3 ?v2) (pred_6 ?v2) (pred_2))
       :effect (and (pred_3 ?v3)
		    (not (pred_4 ?v3 ?v2)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v2)
			    (pred_3 ?v3) (pred_6 ?v2))
       :effect (and (pred_4 ?v3 ?v2)
		    (pred_2)
		    (not (pred_3 ?v3)))))
