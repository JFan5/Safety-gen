; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1607699842 --problem-name spanner-s3-n3-l4-s1607699842
(define (problem spanner-s3-n3-l4-s1607699842)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_08 obj_11 obj_06 - type_1
     obj_10 obj_09 obj_02 - type_3
     obj_13 obj_03 obj_01 obj_12 - type_2
     obj_04 obj_07 - type_2
    )
 (:init 
    (pred_4 obj_05 obj_04)
    (pred_4 obj_08 obj_13)
    (pred_5 obj_08)
    (pred_4 obj_11 obj_03)
    (pred_5 obj_11)
    (pred_4 obj_06 obj_01)
    (pred_5 obj_06)
    (pred_2 obj_10)
    (pred_4 obj_10 obj_07)
    (pred_2 obj_09)
    (pred_4 obj_09 obj_07)
    (pred_2 obj_02)
    (pred_4 obj_02 obj_07)
    (pred_3 obj_04 obj_13)
    (pred_3 obj_12 obj_07)
    (pred_3 obj_13 obj_03)
    (pred_3 obj_03 obj_01)
    (pred_3 obj_01 obj_12)
)
 (:goal
  (and
   (pred_6 obj_10)
   (pred_6 obj_09)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_10)) (not (pred_6 obj_09))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_04)))
  )
)
)
