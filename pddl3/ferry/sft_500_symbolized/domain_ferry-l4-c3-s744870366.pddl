(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_4 ?v4)
		(pred_5 ?v8)
		(pred_3 ?v8)
		(pred_2 ?v4 ?v8)
		(pred_6)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_5 ?v1) (pred_5 ?v2) (pred_3 ?v1))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v7)
			    (pred_2 ?v6 ?v7) (pred_3 ?v7) (pred_6))
       :effect (and (pred_1 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v7)
			    (pred_1 ?v6) (pred_3 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_6)
		    (not (pred_1 ?v6)))))
