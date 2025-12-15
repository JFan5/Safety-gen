(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_09 obj_02 obj_12 obj_06 - type_3
obj_05 obj_04 obj_08 obj_03 - type_2
obj_11 obj_10 obj_13 - object)
(:init
(pred_4 obj_07 obj_03)
(pred_1 obj_07 obj_09)
(pred_1 obj_07 obj_02)
(pred_4 obj_01 obj_04)
(pred_1 obj_01 obj_12)
(pred_1 obj_01 obj_06)
(pred_3 obj_11 obj_08)
(pred_3 obj_10 obj_05)
(pred_3 obj_13 obj_08)
)
(:goal
(and
(pred_3 obj_11 obj_03)
(pred_3 obj_10 obj_05)
(pred_3 obj_13 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_03) (pred_4 obj_01 obj_03))))
  )
)
)