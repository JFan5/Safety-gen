(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_07 - type_3
obj_09 obj_05 obj_06 obj_01 - type_2
obj_12 obj_10 obj_02 obj_04 - type_1
obj_08 obj_13 obj_03 - object)
(:init
(pred_1 obj_11 obj_10)
(pred_2 obj_11 obj_09)
(pred_2 obj_11 obj_05)
(pred_1 obj_07 obj_04)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_01)
(pred_4 obj_08 obj_02)
(pred_4 obj_13 obj_12)
(pred_4 obj_03 obj_12)
)
(:goal
(and
(pred_4 obj_08 obj_04)
(pred_4 obj_13 obj_12)
(pred_4 obj_03 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_02) (pred_1 obj_07 obj_02))))
    (always (not (and (pred_1 obj_11 obj_04) (pred_1 obj_07 obj_04))))
  )
)
)