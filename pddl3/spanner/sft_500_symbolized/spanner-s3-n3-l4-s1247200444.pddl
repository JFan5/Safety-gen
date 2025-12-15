; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1247200444 --problem-name spanner-s3-n3-l4-s1247200444
(define (problem spanner-s3-n3-l4-s1247200444)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_03 obj_09 obj_12 - type_5
     obj_01 obj_10 obj_11 - type_1
     obj_04 obj_13 obj_07 obj_05 - type_4
     obj_02 obj_06 - type_4
    )
 (:init 
    (pred_4 obj_08 obj_02)
    (pred_4 obj_03 obj_07)
    (pred_5 obj_03)
    (pred_4 obj_09 obj_07)
    (pred_5 obj_09)
    (pred_4 obj_12 obj_04)
    (pred_5 obj_12)
    (pred_6 obj_01)
    (pred_4 obj_01 obj_06)
    (pred_6 obj_10)
    (pred_4 obj_10 obj_06)
    (pred_6 obj_11)
    (pred_4 obj_11 obj_06)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_05 obj_06)
    (pred_3 obj_04 obj_13)
    (pred_3 obj_13 obj_07)
    (pred_3 obj_07 obj_05)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_10)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_02)))
  )
)
)
