(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_12 - type_1
obj_07 obj_13 obj_08 obj_04 - type_3
obj_02 obj_05 obj_11 obj_01 - type_2
obj_06 obj_09 obj_03 - object)
(:init
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_07)
(pred_2 obj_10 obj_13)
(pred_4 obj_12 obj_11)
(pred_2 obj_12 obj_08)
(pred_2 obj_12 obj_04)
(pred_1 obj_06 obj_01)
(pred_1 obj_09 obj_11)
(pred_1 obj_03 obj_05)
)
(:goal
(and
(pred_1 obj_06 obj_11)
(pred_1 obj_09 obj_11)
(pred_1 obj_03 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_01) (pred_4 obj_12 obj_01))))
  )
)
)