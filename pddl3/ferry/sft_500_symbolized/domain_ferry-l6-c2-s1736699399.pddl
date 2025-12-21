(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_6 ?v4)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_3 ?v4 ?v5)
		(pred_1)
		(pred_2 ?v4))

   (:action op_2
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_5 ?v7) (pred_5 ?v6) (pred_4 ?v7))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v7))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v8)
			    (pred_3 ?v3 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_2 ?v3)
		    (not (pred_3 ?v3 ?v8)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v8)
			    (pred_2 ?v3) (pred_4 ?v8))
       :effect (and (pred_3 ?v3 ?v8)
		    (pred_1)
		    (not (pred_2 ?v3)))))
