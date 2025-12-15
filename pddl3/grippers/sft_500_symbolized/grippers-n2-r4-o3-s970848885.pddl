(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_2
obj_05 obj_08 obj_06 obj_02 - type_1
obj_03 obj_11 obj_04 obj_01 - type_3
obj_10 obj_07 obj_13 - object)
(:init
(pred_3 obj_09 obj_11)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_08)
(pred_3 obj_12 obj_01)
(pred_2 obj_12 obj_06)
(pred_2 obj_12 obj_02)
(pred_1 obj_10 obj_03)
(pred_1 obj_07 obj_11)
(pred_1 obj_13 obj_04)
)
(:goal
(and
(pred_1 obj_10 obj_03)
(pred_1 obj_07 obj_04)
(pred_1 obj_13 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_04) (pred_3 obj_12 obj_04))))
  )
)
)