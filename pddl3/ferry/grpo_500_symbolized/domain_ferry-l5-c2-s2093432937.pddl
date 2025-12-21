(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_2 ?v2)
		(pred_3 ?v4)
		(pred_1 ?v4)
		(pred_6 ?v2 ?v4)
		(pred_4)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_3 ?v8) (pred_3 ?v3) (pred_1 ?v8))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v1)
			    (pred_6 ?v6 ?v1) (pred_1 ?v1) (pred_4))
       :effect (and (pred_5 ?v6)
		    (not (pred_6 ?v6 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v1)
			    (pred_5 ?v6) (pred_1 ?v1))
       :effect (and (pred_6 ?v6 ?v1)
		    (pred_4)
		    (not (pred_5 ?v6)))))
