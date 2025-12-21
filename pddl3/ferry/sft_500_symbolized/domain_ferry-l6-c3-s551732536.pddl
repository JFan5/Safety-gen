(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_2 ?v4)
		(pred_3 ?v7)
		(pred_4 ?v7)
		(pred_5 ?v4 ?v7)
		(pred_1)
		(pred_6 ?v4))

   (:action op_2
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_3 ?v1) (pred_3 ?v2) (pred_4 ?v1))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v1))))


   (:action op_3
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v8)
			    (pred_5 ?v6 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_6 ?v6)
		    (not (pred_5 ?v6 ?v8)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v8)
			    (pred_6 ?v6) (pred_4 ?v8))
       :effect (and (pred_5 ?v6 ?v8)
		    (pred_1)
		    (not (pred_6 ?v6)))))
