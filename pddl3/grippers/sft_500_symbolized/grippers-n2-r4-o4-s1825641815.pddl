(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_3
obj_09 obj_14 obj_08 obj_12 - type_1
obj_02 obj_05 obj_07 obj_04 - type_2
obj_03 obj_11 obj_13 obj_01 - object)
(:init
(pred_4 obj_06 obj_02)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_14)
(pred_4 obj_10 obj_04)
(pred_1 obj_10 obj_08)
(pred_1 obj_10 obj_12)
(pred_3 obj_03 obj_05)
(pred_3 obj_11 obj_05)
(pred_3 obj_13 obj_07)
(pred_3 obj_01 obj_07)
)
(:goal
(and
(pred_3 obj_03 obj_04)
(pred_3 obj_11 obj_04)
(pred_3 obj_13 obj_02)
(pred_3 obj_01 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_05) (pred_4 obj_10 obj_05))))
    (always (not (and (pred_4 obj_06 obj_04) (pred_4 obj_10 obj_04))))
  )
)
)