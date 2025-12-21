(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_14 obj_10 obj_02 obj_12 - type_2
obj_13 obj_03 obj_04 obj_05 - type_3
obj_06 obj_01 obj_11 obj_09 - object)
(:init
(pred_1 obj_08 obj_13)
(pred_3 obj_08 obj_14)
(pred_3 obj_08 obj_10)
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_02)
(pred_3 obj_07 obj_12)
(pred_2 obj_06 obj_03)
(pred_2 obj_01 obj_05)
(pred_2 obj_11 obj_03)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_01 obj_04)
(pred_2 obj_11 obj_05)
(pred_2 obj_09 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_04) (pred_1 obj_07 obj_04))))
    (always (not (and (pred_1 obj_08 obj_05) (pred_1 obj_07 obj_05))))
  )
)
)