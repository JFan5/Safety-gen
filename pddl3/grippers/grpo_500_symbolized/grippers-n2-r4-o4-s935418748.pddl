(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_07 obj_05 obj_02 obj_09 - type_3
obj_13 obj_01 obj_10 obj_12 - type_2
obj_11 obj_14 obj_03 obj_06 - object)
(:init
(pred_4 obj_04 obj_10)
(pred_2 obj_04 obj_07)
(pred_2 obj_04 obj_05)
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_02)
(pred_2 obj_08 obj_09)
(pred_3 obj_11 obj_10)
(pred_3 obj_14 obj_12)
(pred_3 obj_03 obj_10)
(pred_3 obj_06 obj_10)
)
(:goal
(and
(pred_3 obj_11 obj_10)
(pred_3 obj_14 obj_12)
(pred_3 obj_03 obj_01)
(pred_3 obj_06 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_01) (pred_4 obj_08 obj_01))))
  )
)
)