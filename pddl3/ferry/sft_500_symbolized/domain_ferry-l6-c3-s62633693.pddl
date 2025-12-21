(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_6 ?v2)
		(pred_4 ?v5)
		(pred_3 ?v5)
		(pred_1 ?v2 ?v5)
		(pred_2)
		(pred_5 ?v2))

   (:action op_3
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_4 ?v8) (pred_4 ?v4) (pred_3 ?v8))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v8))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v6)
			    (pred_1 ?v1 ?v6) (pred_3 ?v6) (pred_2))
       :effect (and (pred_5 ?v1)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v6)
			    (pred_5 ?v1) (pred_3 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_2)
		    (not (pred_5 ?v1)))))
