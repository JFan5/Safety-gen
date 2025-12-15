(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_1
obj_02 obj_08 obj_03 obj_11 - type_3
obj_10 obj_12 obj_04 - type_2
obj_07 obj_01 obj_09 - object)
(:init
(pred_3 obj_06 obj_04)
(pred_4 obj_06 obj_02)
(pred_4 obj_06 obj_08)
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_11)
(pred_2 obj_07 obj_04)
(pred_2 obj_01 obj_10)
(pred_2 obj_09 obj_12)
)
(:goal
(and
(pred_2 obj_07 obj_10)
(pred_2 obj_01 obj_04)
(pred_2 obj_09 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_06 obj_04) (pred_3 obj_05 obj_04))))
  )
)
)