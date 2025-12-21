(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_4 ?v4)
		(pred_2 ?v1)
		(pred_3 ?v1)
		(pred_5 ?v4 ?v1)
		(pred_1)
		(pred_6 ?v4))

   (:action op_3
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_2 ?v8) (pred_2 ?v2) (pred_3 ?v8))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v8))))


   (:action op_2
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v3)
			    (pred_5 ?v6 ?v3) (pred_3 ?v3) (pred_1))
       :effect (and (pred_6 ?v6)
		    (not (pred_5 ?v6 ?v3)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v3)
			    (pred_6 ?v6) (pred_3 ?v3))
       :effect (and (pred_5 ?v6 ?v3)
		    (pred_1)
		    (not (pred_6 ?v6)))))
