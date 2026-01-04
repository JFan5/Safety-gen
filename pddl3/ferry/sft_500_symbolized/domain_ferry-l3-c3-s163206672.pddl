(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_2 ?v3)
		(pred_3 ?v5)
		(pred_5 ?v5)
		(pred_6 ?v3 ?v5)
		(pred_1)
		(pred_4 ?v3))

   (:action op_1
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_3 ?v7) (pred_3 ?v6) (pred_5 ?v7))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v7))))


   (:action op_3
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v8)
			    (pred_6 ?v1 ?v8) (pred_5 ?v8) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_6 ?v1 ?v8)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_2 ?v1) (pred_3 ?v8)
			    (pred_4 ?v1) (pred_5 ?v8))
       :effect (and (pred_6 ?v1 ?v8)
		    (pred_1)
		    (not (pred_4 ?v1)))))
