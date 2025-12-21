(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_07 obj_02 obj_05 obj_10 - type_3
obj_11 obj_13 obj_04 obj_01 - type_2
obj_03 obj_09 obj_12 - object)
(:init
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_07)
(pred_2 obj_06 obj_02)
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_05)
(pred_2 obj_08 obj_10)
(pred_3 obj_03 obj_04)
(pred_3 obj_09 obj_04)
(pred_3 obj_12 obj_04)
)
(:goal
(and
(pred_3 obj_03 obj_11)
(pred_3 obj_09 obj_01)
(pred_3 obj_12 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_04) (pred_4 obj_08 obj_04))))
  )
)
)