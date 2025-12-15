(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v4 ?v2)
             (pred_8 ?v1 ?v6)
             (pred_12 ?v4 ?v6)
             (pred_10 ?v10 ?v4 )
	     (pred_2 ?v4)
             (pred_6 ?v8)
             (pred_11 ?v1)
             (pred_7 ?v6)
             (pred_1 ?v4)
             (pred_4 ?v1)
             (pred_5 ?v4)
             (pred_9 ))



(:action op_5
:parameters (?v13 ?v11 ?v7 ?v3)
:precondition (and (pred_6 ?v13) (pred_6 ?v11) (pred_11 ?v7) (pred_7 ?v3)
          (pred_3 ?v13 ?v11) (pred_8 ?v7 ?v3)
                   (pred_12 ?v11 ?v3) (pred_2 ?v13) 
                   (pred_1 ?v11) (pred_4 ?v7))
:effect (and  (pred_5 ?v11) (not (pred_1 ?v11))))


(:action op_4
:parameters (?v13 ?v9)
:precondition (and (pred_6 ?v13) (pred_6 ?v9)
               (pred_2 ?v13) (pred_3 ?v13 ?v9) (pred_5 ?v9))
:effect (and (pred_2 ?v9) (not (pred_2 ?v13))))

(:action op_1
:parameters (?v13 ?v7)
:precondition (and (pred_6 ?v13) (pred_11 ?v7) 
                  (pred_2 ?v13) (pred_10 ?v7 ?v13) (pred_9 ))
:effect (and (pred_4 ?v7)
   (not (pred_10 ?v7 ?v13)) (not (pred_9 ))))


(:action op_3
:parameters (?v13 ?v12 ?v5)
:precondition (and (pred_6 ?v13) (pred_11 ?v12) (pred_11 ?v5)
                  (pred_2 ?v13) (pred_4 ?v5) (pred_10 ?v12 ?v13))
:effect (and (pred_4 ?v12) (pred_10 ?v5 ?v13)
        (not (pred_4 ?v5)) (not (pred_10 ?v12 ?v13))))

(:action op_2
:parameters (?v13 ?v7)
:precondition (and (pred_6 ?v13) (pred_11 ?v7) 
                  (pred_2 ?v13) (pred_4 ?v7))
:effect (and (pred_9 ) (pred_10 ?v7 ?v13) (not (pred_4 ?v7)))))


	
