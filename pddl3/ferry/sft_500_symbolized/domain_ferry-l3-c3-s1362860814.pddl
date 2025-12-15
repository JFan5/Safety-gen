(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_3 ?v6)
		(pred_1 ?v4)
		(pred_5 ?v4)
		(pred_6 ?v6 ?v4)
		(pred_2)
		(pred_4 ?v6))

   (:action op_1
       :parameters  (?v8 ?v7)
       :precondition (and (not-eq ?v8 ?v7) 
                          (pred_1 ?v8) (pred_1 ?v7) (pred_5 ?v8))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v2)
			    (pred_6 ?v1 ?v2) (pred_5 ?v2) (pred_2))
       :effect (and (pred_4 ?v1)
		    (not (pred_6 ?v1 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v2)
			    (pred_4 ?v1) (pred_5 ?v2))
       :effect (and (pred_6 ?v1 ?v2)
		    (pred_2)
		    (not (pred_4 ?v1)))))
