(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_3
obj_02 obj_01 obj_06 obj_07 - type_1
obj_04 obj_05 obj_11 obj_13 - type_2
obj_14 obj_03 obj_10 obj_08 - object)
(:init
(pred_2 obj_12 obj_13)
(pred_4 obj_12 obj_02)
(pred_4 obj_12 obj_01)
(pred_2 obj_09 obj_05)
(pred_4 obj_09 obj_06)
(pred_4 obj_09 obj_07)
(pred_1 obj_14 obj_13)
(pred_1 obj_03 obj_04)
(pred_1 obj_10 obj_11)
(pred_1 obj_08 obj_05)
)
(:goal
(and
(pred_1 obj_14 obj_05)
(pred_1 obj_03 obj_04)
(pred_1 obj_10 obj_05)
(pred_1 obj_08 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_12 obj_13) (pred_2 obj_09 obj_13))))
  )
)
)