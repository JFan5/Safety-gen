; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 474558343 --problem-name spanner-s4-n3-l4-s474558343
(define (problem spanner-s4-n3-l4-s474558343)
 (:domain spanner)
 (:objects 
     obj_09 - type_5
     obj_02 obj_14 obj_01 obj_05 - type_1
     obj_13 obj_10 obj_08 - type_3
     obj_07 obj_11 obj_03 obj_12 - type_4
     obj_04 obj_06 - type_4
    )
 (:init 
    (pred_5 obj_09 obj_04)
    (pred_5 obj_02 obj_07)
    (pred_3 obj_02)
    (pred_5 obj_14 obj_03)
    (pred_3 obj_14)
    (pred_5 obj_01 obj_03)
    (pred_3 obj_01)
    (pred_5 obj_05 obj_07)
    (pred_3 obj_05)
    (pred_6 obj_13)
    (pred_5 obj_13 obj_06)
    (pred_6 obj_10)
    (pred_5 obj_10 obj_06)
    (pred_6 obj_08)
    (pred_5 obj_08 obj_06)
    (pred_2 obj_04 obj_07)
    (pred_2 obj_12 obj_06)
    (pred_2 obj_07 obj_11)
    (pred_2 obj_11 obj_03)
    (pred_2 obj_03 obj_12)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_10)
   (pred_1 obj_08)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_04)))
  )
)
)
