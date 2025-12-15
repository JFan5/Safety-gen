(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_6 ?v4)
		(pred_5 ?v3)
		(pred_3 ?v3)
		(pred_4 ?v4 ?v3)
		(pred_1)
		(pred_2 ?v4))

   (:action op_1
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_5 ?v7) (pred_5 ?v6) (pred_3 ?v7))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v7))))


   (:action op_2
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_5 ?v8)
			    (pred_4 ?v5 ?v8) (pred_3 ?v8) (pred_1))
       :effect (and (pred_2 ?v5)
		    (not (pred_4 ?v5 ?v8)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_5 ?v8)
			    (pred_2 ?v5) (pred_3 ?v8))
       :effect (and (pred_4 ?v5 ?v8)
		    (pred_1)
		    (not (pred_2 ?v5)))))
