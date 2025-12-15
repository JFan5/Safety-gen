(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_06 obj_01 obj_13 obj_05 - type_2
obj_14 obj_04 obj_02 obj_07 - type_3
obj_12 obj_08 obj_10 obj_03 - object)
(:init
(pred_1 obj_09 obj_07)
(pred_2 obj_09 obj_06)
(pred_2 obj_09 obj_01)
(pred_1 obj_11 obj_02)
(pred_2 obj_11 obj_13)
(pred_2 obj_11 obj_05)
(pred_3 obj_12 obj_04)
(pred_3 obj_08 obj_02)
(pred_3 obj_10 obj_04)
(pred_3 obj_03 obj_14)
)
(:goal
(and
(pred_3 obj_12 obj_02)
(pred_3 obj_08 obj_14)
(pred_3 obj_10 obj_02)
(pred_3 obj_03 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_09 obj_04) (pred_1 obj_11 obj_04))))
    (always (not (and (pred_1 obj_09 obj_02) (pred_1 obj_11 obj_02))))
  )
)
)