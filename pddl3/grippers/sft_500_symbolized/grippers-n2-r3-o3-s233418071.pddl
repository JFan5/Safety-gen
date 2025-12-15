(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_03 - type_1
obj_08 obj_11 obj_01 obj_02 - type_2
obj_10 obj_05 obj_04 - type_3
obj_09 obj_12 obj_07 - object)
(:init
(pred_2 obj_06 obj_04)
(pred_1 obj_06 obj_08)
(pred_1 obj_06 obj_11)
(pred_2 obj_03 obj_10)
(pred_1 obj_03 obj_01)
(pred_1 obj_03 obj_02)
(pred_3 obj_09 obj_04)
(pred_3 obj_12 obj_10)
(pred_3 obj_07 obj_05)
)
(:goal
(and
(pred_3 obj_09 obj_10)
(pred_3 obj_12 obj_04)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_06 obj_04) (pred_2 obj_03 obj_04))))
  )
)
)