; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1874507097 --problem-name spanner-s4-n3-l4-s1874507097
(define (problem spanner-s4-n3-l4-s1874507097)
 (:domain spanner)
 (:objects 
     obj_13 - type_3
     obj_14 obj_02 obj_04 obj_11 - type_5
     obj_03 obj_10 obj_05 - type_4
     obj_08 obj_07 obj_01 obj_12 - type_2
     obj_06 obj_09 - type_2
    )
 (:init 
    (pred_2 obj_13 obj_06)
    (pred_2 obj_14 obj_01)
    (pred_1 obj_14)
    (pred_2 obj_02 obj_01)
    (pred_1 obj_02)
    (pred_2 obj_04 obj_01)
    (pred_1 obj_04)
    (pred_2 obj_11 obj_08)
    (pred_1 obj_11)
    (pred_5 obj_03)
    (pred_2 obj_03 obj_09)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_09)
    (pred_5 obj_05)
    (pred_2 obj_05 obj_09)
    (pred_6 obj_06 obj_08)
    (pred_6 obj_12 obj_09)
    (pred_6 obj_08 obj_07)
    (pred_6 obj_07 obj_01)
    (pred_6 obj_01 obj_12)
)
 (:goal
  (and
   (pred_3 obj_03)
   (pred_3 obj_10)
   (pred_3 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_06)))
  )
)
)
