(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_6 ?v3)
		(pred_5 ?v7)
		(pred_3 ?v7)
		(pred_4 ?v3 ?v7)
		(pred_1)
		(pred_2 ?v3))

   (:action op_2
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_5 ?v8) (pred_5 ?v4) (pred_3 ?v8))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v8))))


   (:action op_3
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v2)
			    (pred_4 ?v1 ?v2) (pred_3 ?v2) (pred_1))
       :effect (and (pred_2 ?v1)
		    (not (pred_4 ?v1 ?v2)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v2)
			    (pred_2 ?v1) (pred_3 ?v2))
       :effect (and (pred_4 ?v1 ?v2)
		    (pred_1)
		    (not (pred_2 ?v1)))))
