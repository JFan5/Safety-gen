(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_14 obj_06 obj_03 obj_09 - type_2
obj_11 obj_08 obj_12 obj_04 - type_3
obj_07 obj_10 obj_13 obj_01 - object)
(:init
(pred_1 obj_05 obj_04)
(pred_3 obj_05 obj_14)
(pred_3 obj_05 obj_06)
(pred_1 obj_02 obj_12)
(pred_3 obj_02 obj_03)
(pred_3 obj_02 obj_09)
(pred_2 obj_07 obj_11)
(pred_2 obj_10 obj_08)
(pred_2 obj_13 obj_11)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_07 obj_12)
(pred_2 obj_10 obj_04)
(pred_2 obj_13 obj_04)
(pred_2 obj_01 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_12) (pred_1 obj_02 obj_12))))
    (always (not (and (pred_1 obj_05 obj_04) (pred_1 obj_02 obj_04))))
  )
)
)