(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_02 obj_08 obj_07 obj_01 - type_2
obj_05 obj_04 obj_03 obj_09 - type_3
obj_06 obj_12 obj_13 - object)
(:init
(pred_1 obj_10 obj_09)
(pred_3 obj_10 obj_02)
(pred_3 obj_10 obj_08)
(pred_1 obj_11 obj_05)
(pred_3 obj_11 obj_07)
(pred_3 obj_11 obj_01)
(pred_2 obj_06 obj_05)
(pred_2 obj_12 obj_04)
(pred_2 obj_13 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_03)
(pred_2 obj_12 obj_04)
(pred_2 obj_13 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_03) (pred_1 obj_11 obj_03))))
  )
)
)