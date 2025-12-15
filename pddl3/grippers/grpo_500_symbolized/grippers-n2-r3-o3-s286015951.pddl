(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_07 obj_12 obj_03 obj_10 - type_3
obj_02 obj_04 obj_08 - type_2
obj_01 obj_06 obj_05 - object)
(:init
(pred_3 obj_09 obj_08)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_12)
(pred_3 obj_11 obj_04)
(pred_4 obj_11 obj_03)
(pred_4 obj_11 obj_10)
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_08)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_04)
(pred_2 obj_06 obj_04)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_04) (pred_3 obj_11 obj_04))))
  )
)
)