(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_6 ?v3)
		(pred_4 ?v2)
		(pred_1 ?v2)
		(pred_3 ?v3 ?v2)
		(pred_2)
		(pred_5 ?v3))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_4 ?v7) (pred_4 ?v8) (pred_1 ?v7))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v6)
			    (pred_3 ?v1 ?v6) (pred_1 ?v6) (pred_2))
       :effect (and (pred_5 ?v1)
		    (not (pred_3 ?v1 ?v6)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v6)
			    (pred_5 ?v1) (pred_1 ?v6))
       :effect (and (pred_3 ?v1 ?v6)
		    (pred_2)
		    (not (pred_5 ?v1)))))
