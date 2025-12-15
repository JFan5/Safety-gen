(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_3
obj_08 obj_04 obj_03 obj_06 - type_1
obj_07 obj_11 obj_13 obj_09 - type_2
obj_01 obj_02 obj_10 - object)
(:init
(pred_2 obj_12 obj_11)
(pred_4 obj_12 obj_08)
(pred_4 obj_12 obj_04)
(pred_2 obj_05 obj_13)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_06)
(pred_1 obj_01 obj_13)
(pred_1 obj_02 obj_11)
(pred_1 obj_10 obj_13)
)
(:goal
(and
(pred_1 obj_01 obj_09)
(pred_1 obj_02 obj_07)
(pred_1 obj_10 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_12 obj_07) (pred_2 obj_05 obj_07))))
  )
)
)