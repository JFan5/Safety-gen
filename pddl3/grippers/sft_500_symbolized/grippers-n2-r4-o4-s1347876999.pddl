(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_11 - type_2
obj_14 obj_10 obj_05 obj_07 - type_1
obj_12 obj_02 obj_06 obj_01 - type_3
obj_03 obj_08 obj_09 obj_13 - object)
(:init
(pred_3 obj_04 obj_06)
(pred_1 obj_04 obj_14)
(pred_1 obj_04 obj_10)
(pred_3 obj_11 obj_01)
(pred_1 obj_11 obj_05)
(pred_1 obj_11 obj_07)
(pred_4 obj_03 obj_01)
(pred_4 obj_08 obj_12)
(pred_4 obj_09 obj_01)
(pred_4 obj_13 obj_06)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_4 obj_08 obj_02)
(pred_4 obj_09 obj_12)
(pred_4 obj_13 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_01) (pred_3 obj_11 obj_01))))
  )
)
)