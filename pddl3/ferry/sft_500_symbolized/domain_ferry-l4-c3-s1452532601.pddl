(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_1 ?v4)
		(pred_2 ?v5)
		(pred_6 ?v5)
		(pred_4 ?v4 ?v5)
		(pred_5)
		(pred_3 ?v4))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_2 ?v7) (pred_2 ?v2) (pred_6 ?v7))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v7))))


   (:action op_3
       :parameters (?v6 ?v8)
       :precondition  (and  (pred_1 ?v6) (pred_2 ?v8)
			    (pred_4 ?v6 ?v8) (pred_6 ?v8) (pred_5))
       :effect (and (pred_3 ?v6)
		    (not (pred_4 ?v6 ?v8)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v6  ?v8)
       :precondition  (and  (pred_1 ?v6) (pred_2 ?v8)
			    (pred_3 ?v6) (pred_6 ?v8))
       :effect (and (pred_4 ?v6 ?v8)
		    (pred_5)
		    (not (pred_3 ?v6)))))
