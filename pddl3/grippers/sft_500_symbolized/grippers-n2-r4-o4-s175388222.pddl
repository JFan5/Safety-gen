(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_09 - type_2
obj_10 obj_08 obj_05 obj_06 - type_1
obj_04 obj_13 obj_01 obj_02 - type_3
obj_12 obj_14 obj_11 obj_03 - object)
(:init
(pred_1 obj_07 obj_13)
(pred_3 obj_07 obj_10)
(pred_3 obj_07 obj_08)
(pred_1 obj_09 obj_02)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_06)
(pred_2 obj_12 obj_02)
(pred_2 obj_14 obj_02)
(pred_2 obj_11 obj_04)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_12 obj_02)
(pred_2 obj_14 obj_01)
(pred_2 obj_11 obj_04)
(pred_2 obj_03 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_01) (pred_1 obj_09 obj_01))))
  )
)
)