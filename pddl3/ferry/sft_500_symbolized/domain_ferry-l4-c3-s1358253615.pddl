(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_2 ?v5)
		(pred_3 ?v3)
		(pred_5 ?v3)
		(pred_1 ?v5 ?v3)
		(pred_4)
		(pred_6 ?v5))

   (:action op_2
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_3 ?v8) (pred_3 ?v2) (pred_5 ?v8))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v8))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v6)
			    (pred_1 ?v1 ?v6) (pred_5 ?v6) (pred_4))
       :effect (and (pred_6 ?v1)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v6)
			    (pred_6 ?v1) (pred_5 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_4)
		    (not (pred_6 ?v1)))))
