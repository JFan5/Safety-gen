; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1549981798 --problem-name spanner-s3-n3-l4-s1549981798
(define (problem spanner-s3-n3-l4-s1549981798)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_13 obj_07 obj_04 - type_5
     obj_08 obj_05 obj_12 - type_4
     obj_02 obj_09 obj_01 obj_10 - type_2
     obj_03 obj_06 - type_2
    )
 (:init 
    (pred_2 obj_11 obj_03)
    (pred_2 obj_13 obj_09)
    (pred_1 obj_13)
    (pred_2 obj_07 obj_01)
    (pred_1 obj_07)
    (pred_2 obj_04 obj_01)
    (pred_1 obj_04)
    (pred_5 obj_08)
    (pred_2 obj_08 obj_06)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_06)
    (pred_5 obj_12)
    (pred_2 obj_12 obj_06)
    (pred_6 obj_03 obj_02)
    (pred_6 obj_10 obj_06)
    (pred_6 obj_02 obj_09)
    (pred_6 obj_09 obj_01)
    (pred_6 obj_01 obj_10)
)
 (:goal
  (and
   (pred_3 obj_08)
   (pred_3 obj_05)
   (pred_3 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_08)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_03)))
  )
)
)
