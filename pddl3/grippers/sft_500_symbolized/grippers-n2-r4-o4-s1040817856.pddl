(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_3
obj_02 obj_11 obj_08 obj_09 - type_2
obj_05 obj_03 obj_12 obj_13 - type_1
obj_06 obj_10 obj_14 obj_04 - object)
(:init
(pred_2 obj_07 obj_03)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_11)
(pred_2 obj_01 obj_05)
(pred_4 obj_01 obj_08)
(pred_4 obj_01 obj_09)
(pred_1 obj_06 obj_05)
(pred_1 obj_10 obj_05)
(pred_1 obj_14 obj_12)
(pred_1 obj_04 obj_05)
)
(:goal
(and
(pred_1 obj_06 obj_05)
(pred_1 obj_10 obj_12)
(pred_1 obj_14 obj_13)
(pred_1 obj_04 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_07 obj_13) (pred_2 obj_01 obj_13))))
  )
)
)